from odoo import models, fields

class VehiclesVehicle(models.Model):
    _name = 'vehicles.vehicle'
    _description = 'Vehicle Model'

    year = fields.Integer()
    make = fields.Char()
    model = fields.Char()
    mileage = fields.Integer()
    vin = fields.Char()
    license = fields.Char()