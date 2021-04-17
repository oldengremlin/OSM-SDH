    SELECT
        osm.almlog.handle,
        TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.almlog.timeraised, 'SECOND') AS timeraised,
        TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.almlog.timecleared, 'SECOND') AS timecleared,
        TIMESTAMP '1970-01-01 00:00:00' + numtodsinterval(osm.node.commsuptime, 'SECOND') AS commsuptime,
        osm.node.adminstate,
        osm.node.commstate,
        osm.node.model,
        osm.node.displayname,
        osm.almlog.sourceid,
        osm.almlog.additionaltext,
        osm.domain.domainname,
        osm.node.nativeversion,
        osm.node.interfaceversion
    FROM
        osm.almlog
    LEFT JOIN osm.domain ON ( osm.domain.domainid = osm.almlog.nndomain )
    LEFT JOIN osm.node ON ( osm.almlog.nodeid = osm.node.name )
    ORDER BY
        timeraised DESC,
        timecleared DESC,
        commsuptime DESC,
        osm.almlog.handle
;