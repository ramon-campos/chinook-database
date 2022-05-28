SELECT
  ar.Name AS ArtistName,
  COUNT(tr.TrackId) AS NumberOfTracks
FROM Artist AS ar
JOIN Album AS al
  ON ar.ArtistId = al.ArtistId
JOIN Track AS tr
  ON al.AlbumId = tr.AlbumId
JOIN Genre AS ge
  ON tr.GenreId = ge.GenreId
WHERE ge.Name LIKE 'Latin'
GROUP BY ArtistName
ORDER BY NumberOfTracks DESC
LIMIT 10