# Generated by Django 5.1.2 on 2024-12-16 14:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modules', '0012_module_enrolled_students_module_instructors_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='module',
            name='instructors',
        ),
        migrations.AlterField(
            model_name='module',
            name='available',
            field=models.CharField(choices=[('OPEN', 'Open'), ('CLOSED', 'Closed'), ('WAITLIST', 'Waitlist')], max_length=255),
        ),
    ]