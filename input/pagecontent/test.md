## Mapping entre les datatypes CDA et les datatypes FHIR

{% sql {
  "query": "
WITH Mappings AS (
  SELECT
    COALESCE(
      r.name,
      json_extract(r.json, '$.name')
    ) AS ConceptMapName,
    COALESCE(
      json_extract(e.value, '$.display'),
      json_extract(e.value, '$.code')
    ) AS CDA,
    COALESCE(
      json_extract(t.value, '$.display'),
      json_extract(t.value, '$.code')
    ) AS FHIR,
    g.key AS group_index,
    e.key AS elem_index,
    t.key AS target_index
  FROM Resources r
  JOIN json_each(r.json, '$.group') g
  JOIN json_each(g.value, '$.element') e
  JOIN json_each(e.value, '$.target') t
  WHERE r.Type = 'ConceptMap'
)

SELECT
  CDA,
  FHIR
FROM Mappings
WHERE ConceptMapName IN (
  'CdaIIToIdentifier'
)
ORDER BY ConceptMapName, group_index, elem_index, target_index
",
  "class": "lines",
  "columns": [
    { "name": "CDA", "type": "markdown", "source": "CDA" },
    { "name": "FHIR", "type": "markdown", "source": "FHIR" }
  ]
} %}