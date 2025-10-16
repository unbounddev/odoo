from odoo import api, models, fields

class VehiclesVehicle(models.Model):
    _name = 'vehicles.vehicle'
    _description = 'Vehicle Model'

    year = fields.Integer(default=fields.Date.today().year)
    make = fields.Char()
    model = fields.Char()
    mileage = fields.Integer(default=0)
    vin = fields.Char()
    license = fields.Char()
    customer_id = fields.Many2one("res.partner", string="Customer")

    @api.depends('make', 'model', 'license', 'vin')
    def _compute_display_name(self):
        for record in self:
            record.display_name = '%s%s%s%s' % (record.make and '%s ' % record.make or '', record.model and '%s ' % record.model or '', record.license and '%s ' % f"({record.license})" or '', record.vin and '%s' % f"[{record.vin}]" or '')