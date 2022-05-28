SELECT
  ar.Name AS ArtistName,
  ROUND(SUM(il.UnitPrice), 2) AS Total
FROM Artist AS ar
JOIN Album AS al
  ON ar.ArtistId = al.ArtistId
JOIN Track AS tr
  ON al.AlbumId = tr.AlbumId
JOIN InvoiceLine AS il
  ON tr.TrackId = il.TrackId
JOIN Genre AS ge
  ON tr.GenreId = ge.GenreId
WHERE ge.Name NOT IN ('Comedy', 'Drama', 'Sci Fi & Fantasy', 'Science Fiction', 'Soundtrack', 'TV Shows')
GROUP BY ar.ArtistId,
         ArtistName
ORDER BY Total DESC
LIMIT 5