SELECT 
    p.nom_produit AS "Produit", 
    v.date_vente AS "Date de Vente", 
    v.quantite_vendue AS "Quantité",
    vi.nom_ville AS "Ville du Magasin"
FROM ventes AS v
INNER JOIN produits AS p ON v.id_produit = p.id_produit
INNER JOIN magasins AS m ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi ON m.id_ville = vi.id_ville
ORDER BY v.date_vente DESC;


SELECT 
    p.nom_produit AS "Produit", 
    p.prix AS "Prix Unitaire", 
    v.quantite_vendue AS "Quantité"
FROM ventes AS v
INNER JOIN produits AS p ON v.id_produit = p.id_produit
INNER JOIN magasins AS m ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi ON m.id_ville = vi.id_ville
WHERE vi.nom_ville IN ('Goma', 'Bukavu');

SELECT 
    p.nom_produit AS "Produit Running", 
    SUM(v.quantite_vendue) AS "Total Quantités Vendues"
FROM ventes AS v
INNER JOIN produits AS p ON v.id_produit = p.id_produit
INNER JOIN categories AS c ON p.id_categorie = c.id_categorie
INNER JOIN magasins AS m ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi ON m.id_ville = vi.id_ville
WHERE vi.nom_ville = 'Lubumbashi' 
  AND c.nom_categorie = 'Running'
GROUP BY p.nom_produit
ORDER BY "Total Quantités Vendues" DESC;

SELECT 
    m.nom_magasin AS "Magasin", 
    vi.nom_ville AS "Ville", 
    SUM(v.quantite_vendue * p.prix) AS "Chiffre d'Affaires Total"
FROM ventes AS v
INNER JOIN produits AS p ON v.id_produit = p.id_produit
INNER JOIN magasins AS m ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi ON m.id_ville = vi.id_ville
GROUP BY m.nom_magasin, vi.nom_ville
ORDER BY "Chiffre d'Affaires Total" DESC;

SELECT DISTINCT 
    vi.nom_ville AS "Ville", 
    c.nom_categorie AS "Catégorie Vendue"
FROM ventes AS v
INNER JOIN produits AS p ON v.id_produit = p.id_produit
INNER JOIN categories AS c ON p.id_categorie = c.id_categorie
INNER JOIN magasins AS m ON v.id_magasin = m.id_magasin
INNER JOIN villes AS vi ON m.id_ville = vi.id_ville
ORDER BY vi.nom_ville, c.nom_categorie;