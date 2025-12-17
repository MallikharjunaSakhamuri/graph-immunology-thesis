# === Load files ===
load 1ajx_protein.mol2, protein
load 1ajx_ligand.mol2, ligand

# === Set background to white and high quality ===
bg_color white
set ray_trace_mode, 1
set ray_opaque_background, off
set antialias, 2

# ---------------------------------------------------
# FILE 1: Protein Only
# ---------------------------------------------------
hide everything
show sticks, protein
color cyan, protein
zoom protein
ray 1200, 1200
png protein_only.png, dpi=300

# ---------------------------------------------------
# FILE 2: Ligand Only
# ---------------------------------------------------
hide everything
show sticks, ligand
color green, ligand
zoom ligand, 10
ray 1200, 1200
png ligand_only.png, dpi=300

# ---------------------------------------------------
# FILE 3: Protein–Ligand Interaction (PL + Interface)
# ---------------------------------------------------
hide everything
show sticks, protein
show sticks, ligand
color cyan, protein
color green, ligand

select binding_site, br. (protein within 5 of ligand)
color magenta, binding_site
show sticks, binding_site

zoom
ray 1200, 1200
png pli_complex.png, dpi=300

# (Optional: save session)
save protein_ligand_views.pse
