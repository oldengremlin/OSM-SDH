(
    SELECT
        osm.almlog.handle,
        0 AS type,
        TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.almlog.timeraised, 'SECOND') AS time,
        osm.node.adminstate,
        osm.node.commstate,
        osm.node.model,
        osm.node.displayname,
        osm.almlog.sourceid,
        osm.domain.domainname,
        osm.node.nativeversion,
        osm.node.interfaceversion,
        osm.almlog.additionaltext
    FROM osm.almlog
    LEFT JOIN osm.domain ON ( osm.domain.domainid = osm.almlog.nndomain )
    LEFT JOIN osm.node ON ( osm.almlog.nodeid = osm.node.name )
)
UNION
(
    SELECT
        osm.almlog.handle,
        1 AS type,
        TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.almlog.timecleared, 'SECOND') AS time,
        osm.node.adminstate,
        osm.node.commstate,
        osm.node.model,
        osm.node.displayname,
        osm.almlog.sourceid,
        osm.domain.domainname,
        osm.node.nativeversion,
        osm.node.interfaceversion,
        osm.almlog.additionaltext
    FROM osm.almlog
    LEFT JOIN osm.domain ON ( osm.domain.domainid = osm.almlog.nndomain )
    LEFT JOIN osm.node ON ( osm.almlog.nodeid = osm.node.name )
)
ORDER BY time DESC, handle;