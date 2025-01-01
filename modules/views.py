
# Create your views here.
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .models import Module
from registrations.models import Registration
from django.contrib import messages
from django.contrib.auth.models import Group


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

def enroll_in_module(request, module_id):
    module = get_object_or_404(Module, id=module_id)
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

    return redirect('modules:module_detail', module_id=module.id)







# def module_detail(request, module_id):
#     module = get_object_or_404(Module, id=module_id)
#     is_enrolled = module.enrolled_students.filter(id=request.user.id).exists() if request.user.is_authenticated else False
#     return render(request, 'modules/module_detail.html', {'module': module, 'is_enrolled': is_enrolled})

def module_detail(request, module_id):
    module = get_object_or_404(Module, id=module_id)
    is_enrolled = request.user.groups.filter(name=module.name).exists()

    # Get all students registered for this module
    registrations = Registration.objects.filter(module=module)

    return render(request, 'modules/module_detail.html', {
        'module': module,
        'is_enrolled': is_enrolled,
        'registrations': registrations,  # Pass registrations to the template
    })


@login_required
def unenroll_from_module(request, module_id):
    module = get_object_or_404(Module, id=module_id)
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

    return redirect('modules:module_detail', module_id=module.id)



def list_modules(request):
    modules = Module.objects.all()
    return render(request, 'modules/module_list.html', {'modules': modules})