# Generated by Django 5.1.2 on 2025-01-04 23:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modules', '0019_alter_module_available'),
    ]

    operations = [
        migrations.AlterField(
            model_name='module',
            name='available',
            field=models.CharField(choices=[('CLOSED', 'Closed'), ('OPEN', 'Open'), ('WAITLIST', 'Waitlist')], max_length=255),
        ),
    ]
