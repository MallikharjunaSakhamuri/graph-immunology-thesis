# === Load structures ===
load 1ajx_protein.mol2, protein
load 1ajx_ligand.mol2, ligand

# === Initial view setup ===
hide everything
show sticks, protein
show sticks, ligand
show spheres, protein
show spheres, ligand

# === Color by atom type ===
color cyan, elem C and protein
color green, elem C and ligand
color blue, elem N
color red, elem O
color yellow, elem S
color magenta, elem P

# === Bond and atom rendering style ===
set stick_radius, 0.2
set stick_quality, 32
set sphere_scale, 0.25
set sphere_quality, 2
set ray_trace_mode, 1
set ray_trace_color, black

# === Label atoms ===
label elem C, name
set label_color, black
set label_size, 14

# === Hydrogen bonds (if any)
distance hbonds, (protein), (ligand), mode=2
hide labels, hbonds  # hide distance label, keep dashed line
color gray70, hbonds
set dash_radius, 0.1

# === Background and lighting ===
bg_color white
set ambient, 0.2
set specular, 0.5
set shininess, 10

# === Orientation and zoom ===
zoom all
orient

# === Save views ===

# 1. Full PLI complex
png pli_complex_highlighted.png, dpi=300, ray=1

# 2. Only protein
hide ligand
hide hbonds
png protein_only_highlighted.png, dpi=300, ray=1

# 3. Only ligand
hide protein
show sticks, ligand
show spheres, ligand
png ligand_only_highlighted.png, dpi=300, ray=1
