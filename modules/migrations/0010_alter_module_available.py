# Generated by Django 5.1.2 on 2024-12-16 14:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modules', '0009_alter_module_available'),
    ]

    operations = [
        migrations.AlterField(
            model_name='module',
            name='available',
            field=models.CharField(choices=[('WAITLIST', 'Waitlist'), ('OPEN', 'Open'), ('CLOSED', 'Closed')], max_length=255),
        ),
    ]