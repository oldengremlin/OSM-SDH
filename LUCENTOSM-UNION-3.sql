SELECT
    osm.alarmevent.handle,
    0 AS type,
    osm.alarmevent.timeraised AS utime,
    osm.node.adminstate,
    osm.node.commstate,
    osm.node.model,
    osm.node.displayname,
    osm.alarmevent.nativeprobcause,
    osm.alarmevent.sourceid,
    osm.alarmevent.domainname,
    osm.node.nativeversion,
    osm.node.interfaceversion,
    osm.alarmevent.additionaltext
FROM OSM.alarmevent
LEFT JOIN osm.node ON ( osm.alarmevent.nodeid = osm.node.name )
WHERE osm.alarmevent.timecleared=-2
;
