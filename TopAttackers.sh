#!/bin/bash

DATE=`date -d "1 hour ago" +%FT%H:00:00.000Z`
cat <<EOF  | mongo --quiet mnemosyne
print("honeypot\tip\tcount");
db.session.aggregate([
    {
    	"\$match": {
    		"timestamp": {
    			"\$gte": ISODate("$DATE")
    		},
    		"honeypot": {
    			"\$ne": null
    		},
    		"source_ip": {
    			"\$ne": null
    		}
    	}
    },
    {
    	"\$group": {
    		"count": {
    			"\$sum": 1
    		},
    		"_id": {
    			"honeypot": "\$honeypot",
    			"source_ip": "\$source_ip"
    		}
    	}
    },
    {
    	"\$sort": {
    		"count": -1
    	}
    }
]
).forEach(function(rec){
    var out = rec["_id"]
    out['count'] = rec['count']
    print(out.honeypot+ "\t"+ out.source_ip + "\t"+ out.count);
});
EOF

