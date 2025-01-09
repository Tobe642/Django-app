
# Create your views here.
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .models import Module
from registrations.models import Registration
from django.contrib import messages
from django.contrib.auth.models import Group
from django.db.models import Count
from django.core.paginator import Paginator


# @login_required
# def enroll_in_module(request, module_issd):
#     module = get_object_or_404(Module, id=module_id)
#     user = request.user

#     # Check if the user is already enrolled
#     if not module.enrolled_students.filter(id=user.id).exists():
#         module.enrolled_students.add(user)
#         messages.success(request, f"You have successfully enrolled in {module.name}.")
#     else:
#         messages.warning(request, f"You are already enrolled in {module.name}.")

#     # Use the namespace 'modules' to reverse the URL
#     return redirect('modules:module_detail', module_id=module.id)

#here
def enroll_in_module(request, module_code):
    module = get_object_or_404(Module, code=module_code)
    student = request.user

    # Add the student to the Group (existing logic)
    group, created = Group.objects.get_or_create(name=module.name)
    if not student.groups.filter(name=module.name).exists():
        student.groups.add(group)

        # Add a Registration entry for admin purposes
        Registration.objects.get_or_create(
            student=student.student,  # Ensure you use the Student model relationship
            module=module
        )
        messages.success(request, f"You have successfully enrolled in {module.name}!")
    else:
        messages.info(request, f"You are already enrolled in {module.name}.")

    return redirect('modules:module_detail', module_code=module.code)







# def module_detail(request, module_id):
#     module = get_object_or_404(Module, id=module_id)
#     is_enrolled = module.enrolled_students.filter(id=request.user.id).exists() if request.user.is_authenticated else False
#     return render(request, 'modules/module_detail.html', {'module': module, 'is_enrolled': is_enrolled})

def module_detail(request, module_code):
    module = get_object_or_404(Module, code=module_code)  # Lookup by module code
    is_enrolled = request.user.groups.filter(name=module.name).exists() if request.user.is_authenticated else False

    # Get all students registered for this module
    registrations = Registration.objects.filter(module=module)

    return render(request, 'modules/module_detail.html', {
        'module': module,
        'is_enrolled': is_enrolled,
        'registrations': registrations,  # Pass registrations to the template
    })


#HERE 
@login_required
def unenroll_from_module(request, module_code):
    module = get_object_or_404(Module, code=module_code)
    user = request.user

    # Remove the student from the Group
    group = Group.objects.filter(name=module.name).first()
    if group and user.groups.filter(name=module.name).exists():
        user.groups.remove(group)

        # Remove the user from enrolled_students (if using this field)
        if module.enrolled_students.filter(id=user.id).exists():
            module.enrolled_students.remove(user)

        Registration.objects.filter(student=user.student, module=module).delete()


        messages.success(request, f"You have successfully unenrolled from {module.name}.")
    else:
        messages.warning(request, f"You are not enrolled in {module.name}.")

    return redirect('modules:module_detail', module_code=module.code)


#HERE
def list_modules(request):
    # Fetch all modules for pagination
    modules = Module.objects.annotate(student_count=Count('registration__id'))

    # Apply pagination
    paginator = Paginator(modules, 6)  # Show 10 modules per page
    page_number = request.GET.get('page')  # Get the page number from query parameters
    page_obj = paginator.get_page(page_number)  # Get the current page of modules

    # Fetch most popular modules (modules with the most enrolled students)
    popular_modules = modules.order_by('-student_count')[:4]


    # Fetch recently added modules (if `date_added` exists, otherwise use `id`)
    recent_modules = Module.objects.order_by('-id')[:4]  # Replace `id` with `date_added` if available

    return render(request, 'modules/module_list.html', {
        'page_obj': page_obj,  # Pass the paginated modules
        'popular_modules': popular_modules,  # Pass popular modules
        'recent_modules': recent_modules,  # Pass recently added modules
    })
    #return render(request, 'modules/module_list.html', {'modules': modules})