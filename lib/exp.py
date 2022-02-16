class Viscosity:

    def __init__(self, time_water, rd_weight_water):
        self.time_water = time_water
        self.rd_weight_water = rd_weight_water
        self.observation_table = {}

    def take_reading(self, conc, t1, t2, rd_weight, t3=-1, ):
        self.observation_table['conc'] = conc
        if t3 > -1:
            t = (t1 + t2 + t3) / 3
            self.observation_table['conc']['t3'] = t3
        else:
            t = (t1 + t2) / 2
        self.observation_table['conc']['t1'] = t1
        self.observation_table['conc']['t2'] = t2
        self.observation_table['conc']['mean'] = t
        self.observation_table['conc']['rel_den'] = rd_weight / self.rd_weight_water
        self.observation_table['conc']['rel_vis'] = self.observation_table['conc']['rel_den'] * (t / self.time_water)
