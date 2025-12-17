# === Load files ===
load 1a0t_protein.mol2, protein
load 1a0t_ligand.mol2, ligand

# === Set background to white and high quality ===
bg_color white
set ray_trace_mode, 1
set ray_opaque_background, off
set antialias, 2

# === Identify binding site residues ===
select binding_site, br. (protein within 5 of ligand)

# ---------------------------------------------------
# FILE 1: Protein Binding Site Only
# ---------------------------------------------------
hide everything
show sticks, binding_site
color cyan, binding_site
zoom binding_site, 10
ray 1200, 1200
png protein_binding_site_only.png, dpi=300

# Save only binding site as protein MOL2
create protein_binding_site_only, binding_site
save protein_binding_site_output.mol2, protein_binding_site_only

# ---------------------------------------------------
# FILE 2: Ligand Only
# ---------------------------------------------------
hide everything
show sticks, ligand
color green, ligand
zoom ligand, 10
ray 1200, 1200
png ligand_only.png, dpi=300

# Save ligand MOL2
save ligand_output.mol2, ligand

# ---------------------------------------------------
# FILE 3: Protein–Ligand Interaction (PL + Interface)
# ---------------------------------------------------
hide everything
show sticks, ligand
show sticks, binding_site
color green, ligand
color cyan, binding_site

# Optional: Highlight potential hydrogen bonds (if any)
distance hbonds, (binding_site), (ligand), mode=2
hide labels

zoom
ray 1200, 1200
png pli_complex.png, dpi=300

# Save PLI complex (binding site + ligand only)
create pli_complex, binding_site or ligand
save pli_complex_output.mol2, pli_complex

# === Optional: Save session ===
save protein_ligand_views.pse
