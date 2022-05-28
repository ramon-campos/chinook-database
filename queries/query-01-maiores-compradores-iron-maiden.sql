SELECT
  ct.CustomerId,
  ct.FirstName || ' ' || ct.LastName AS CustomerName,
  ar.Name AS ArtistName,
  SUM(il.UnitPrice * il.Quantity) AS TotalSpent
FROM Artist AS ar
JOIN Album AS al
  ON ar.ArtistId = al.ArtistId
JOIN Track AS tr
  ON al.AlbumId = tr.AlbumId
JOIN InvoiceLine AS il
  ON tr.TrackId = il.TrackId
JOIN Invoice AS inv
  ON il.InvoiceId = inv.InvoiceId
JOIN Customer AS ct
  ON inv.CustomerId = ct.CustomerId
WHERE ar.Name LIKE 'Iron Maiden'
GROUP BY ct.CustomerId,
         ct.FirstName,
         ct.LastName,
         ArtistName
ORDER BY TotalSpent DESC
LIMIT 5