# === Load complex structure ===
load your_complex.mol2, complex

# === Create clear selections ===
select 1a2c_protein, complex and polymer
select 1a2c_ligand, complex and not polymer

# Alternative: Use residue name if ligand is not properly separated
# select ligand, resn LIG  # Replace LIG with actual ligand residue name

# === Save Structures Separately ===
save protein_only.mol2, protein
save ligand_only.mol2, ligand
create pli_complex, protein or ligand
save pli_complex.mol2, pli_complex

# === Clean Visualization Settings ===
hide everything
show sticks, pli_complex

color cyan, elem C and protein
color green, elem C and ligand
color red, elem O
color blue, elem N
color yellow, elem S

bg_color white
set stick_radius, 0.2
set stick_quality, 32
set ray_trace_mode, 1
set ray_trace_gain, 0.1
set ambient, 0.18
set ray_shadow, off

zoom pli_complex
orient pli_complex

# === Render clean images ===
png pli_complex_clean.png, dpi=300, ray=1

hide ligand
png protein_only_clean.png, dpi=300, ray=1

hide protein
show sticks, ligand
png ligand_only_clean.png, dpi=300, ray=1
