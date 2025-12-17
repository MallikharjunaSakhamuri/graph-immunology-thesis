#!/bin/bash
ICHEM_LIC=/home/mvolkov/software/IChem/IChem.lic
export ICHEM_LIC
python /home/mvolkov/GraphUnistra/repos/pl-graph-generation-dist/interaction_graph_gen/scripts/iktos_alt_generate_graphs_for_xray_structs.py --detection_range 6.0 --cpu_cores 1