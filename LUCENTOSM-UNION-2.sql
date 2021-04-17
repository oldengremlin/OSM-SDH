( SELECT
    ( TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.almlog.timeraised, 'SECOND') ) AT TIME ZONE 'EET'          AS time,
    2                                                                                                                  AS sortorder,
    0                                                                                                                  AS type,
    osm.almlog.handle,
    osm.almlog.timeraised                                                                                              AS utime,
    osm.node.adminstate,
    osm.node.commstate,
    osm.node.model,
    osm.node.displayname,
    osm.almlog.nativeprobcause,
    osm.almlog.sourceid,
    osm.almlog.domainname,
    osm.node.nativeversion,
    osm.node.interfaceversion,
    osm.almlog.additionaltext
FROM
    osm.almlog,
    osm.node
WHERE
    ( osm.almlog.nodeid = osm.node.name (+) )
    AND osm.almlog.timeraised >= 1615859716
)
UNION
( SELECT
    ( TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.almlog.timecleared, 'SECOND') ) AT TIME ZONE 'EET'          AS time,
    3                                                                                                                   AS sortorder,
    1                                                                                                                   AS type,
    osm.almlog.handle,
    osm.almlog.timecleared                                                                                              AS utime,
    osm.node.adminstate,
    osm.node.commstate,
    osm.node.model,
    osm.node.displayname,
    osm.almlog.nativeprobcause,
    osm.almlog.sourceid,
    osm.almlog.domainname,
    osm.node.nativeversion,
    osm.node.interfaceversion,
    osm.almlog.additionaltext
FROM
    osm.almlog,
    osm.node
WHERE
    ( osm.almlog.nodeid = osm.node.name (+) )
    AND osm.almlog.timecleared >= 1615859716
)
UNION
( SELECT
    ( TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.alarmevent.timeraised, 'SECOND') ) AT TIME ZONE 'EET'          AS time,
    0                                                                                                                      AS sortorder,
    2                                                                                                                      AS type,
    osm.alarmevent.handle,
    osm.alarmevent.timeraised                                                                                              AS utime,
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
FROM
    osm.alarmevent,
    osm.node
WHERE
    ( osm.alarmevent.nodeid = osm.node.name (+) )
    AND osm.alarmevent.timeraised >= 1615859716
)
UNION
( SELECT
    ( TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.alarmevent.timecleared, 'SECOND') ) AT TIME ZONE 'EET'          AS time,
    1                                                                                                                       AS sortorder,
    3                                                                                                                       AS type,
    osm.alarmevent.handle,
    osm.alarmevent.timecleared                                                                                              AS utime,
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
FROM
    osm.alarmevent,
    osm.node
WHERE
    ( osm.alarmevent.nodeid = osm.node.name (+) )
    AND osm.alarmevent.timecleared >= 1615859716
)
ORDER BY
    utime,
    sortorder,
    type,
    handle