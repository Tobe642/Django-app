
# Create your views here.
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .models import Module
from django.contrib import messages

@login_required
def enroll_in_module(request, module_id):
    module = get_object_or_404(Module, id=module_id)
    user = request.user

    # Check if the user is already enrolled
    if not module.enrolled_students.filter(id=user.id).exists():
        module.enrolled_students.add(user)
        messages.success(request, f"You have successfully enrolled in {module.name}.")
    else:
        messages.warning(request, f"You are already enrolled in {module.name}.")

    # Use the namespace 'modules' to reverse the URL
    return redirect('modules:module_detail', module_id=module.id)

def module_detail(request, module_id):
    module = get_object_or_404(Module, id=module_id)
    is_enrolled = module.enrolled_students.filter(id=request.user.id).exists() if request.user.is_authenticated else False
    return render(request, 'modules/module_detail.html', {'module': module, 'is_enrolled': is_enrolled})

@login_required
def unenroll_from_module(request, module_id):
    module = get_object_or_404(Module, id=module_id)
    user = request.user

    # Check if the user is actually enrolled
    if module.enrolled_students.filter(id=user.id).exists():
        module.enrolled_students.remove(user)  # Unenroll the user
        messages.success(request, f"You have successfully unenrolled from {module.name}.")
    else:
        messages.warning(request, f"You are not enrolled in {module.name}.")

    return redirect('modules:module_detail', module_id=module.id)


@login_required
def list_modules(request):
    modules = Module.objects.all()
    return render(request, 'modules/module_list.html', {'modules': modules})