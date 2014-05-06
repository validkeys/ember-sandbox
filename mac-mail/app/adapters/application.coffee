# ApplicationAdapter = DS.LSAdapter.extend
#   namespace: "mac-mail"

ApplicationAdapter = DS.FixtureAdapter.extend
  queryFixtures: (records, query, type) ->
    records.filter (record) ->
      for key of query
        continue  unless query.hasOwnProperty(key)
        value = query[key]
        return false  if record[key] isnt value
      true

`export default ApplicationAdapter;`