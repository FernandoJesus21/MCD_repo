--tabla pivot
SELECT periodo, residencia_provincia_nombre,
       COALESCE(round(sum((CASE WHEN clasificacion_resumen = 'Confirmado' THEN cant_casos END)), 2), 0) AS "Confirmado",
       COALESCE(round(sum((CASE WHEN clasificacion_resumen = 'Sospechoso' THEN cant_casos END)), 2), 0) AS "Sospechoso",
       COALESCE(round(sum((CASE WHEN clasificacion_resumen = 'Descartado' THEN cant_casos END)), 2), 0) AS "Descartado"
FROM public.covid_tbl
GROUP BY periodo, residencia_provincia_nombre
ORDER BY periodo, residencia_provincia_nombre