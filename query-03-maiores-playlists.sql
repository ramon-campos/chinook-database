SELECT
  pl.Name,
  COUNT(plt.TrackId) AS NumberOfTracks
FROM Playlist AS pl
JOIN PlaylistTrack AS plt
  ON pl.PlaylistId = plt.PlaylistId
GROUP BY pl.Name
ORDER BY NumberOfTracks DESC
LIMIT 5