# Generated by Django 5.1.2 on 2024-12-09 23:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registrations', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='registration',
            name='date',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
    ]