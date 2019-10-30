
using Pkg
Pkg.activate("../../.")


using PowerSystems
using TimeSeries
const PSY = PowerSystems
const IS = PSY.InfrastructureSystems;


PSY.download(PSY.TestData; branch = "master")
base_dir = dirname(dirname(pathof(PowerSystems)));


RTS_GMLC_DIR = joinpath(base_dir,"data/RTS_GMLC");
rawsys = PSY.PowerSystemTableData(RTS_GMLC_DIR,100.0, joinpath(RTS_GMLC_DIR,"user_descriptors.yaml"))


sys = System(rawsys; forecast_resolution = Dates.Hour(1));

sys
