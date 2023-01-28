# Generated by Django 4.1.5 on 2023-01-28 16:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_alter_transaction_timestamp_alter_transaction_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='transaction',
            name='basic',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='transaction',
            name='category',
            field=models.CharField(default='food', max_length=100),
            preserve_default=False,
        ),
    ]