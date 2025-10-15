from odoo import models, fields

class ResPartner(models.Model):
    _inherit = 'res.partner'

    vehicle_ids = fields.One2many("vehicles.vehicle", "customer_id", string="Vehicles")