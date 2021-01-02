# Generated by Django 3.1.4 on 2021-01-02 15:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('store', '0001_initial'),
        ('material', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Production',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productionDate', models.DateField()),
                ('creDate', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Manufacture',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField()),
                ('creDate', models.DateTimeField(auto_now_add=True)),
                ('productInventoryId', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='store.inventory')),
                ('productionId', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='product.production')),
            ],
        ),
        migrations.CreateModel(
            name='Consume',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('costAmount', models.IntegerField()),
                ('creDate', models.DateTimeField(auto_now_add=True)),
                ('materialInventoryId', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='material.inventory')),
                ('productionId', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='product.production')),
            ],
        ),
    ]
