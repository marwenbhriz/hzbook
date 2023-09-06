# MongoDB

## Initializing

```sh
# 1. Change to the directory
cd ./db/mongodb-rs/

# 2. Configure hostvm nodes via daemonset and startup-script
kubectl apply -f hostvm-node-configurer-ds.yaml

# 3. Create keyfile and store as secret in k8s
./do.sh create_keyfile

# 4. Create mongodb service and statefulsets
kubectl apply -f mongo-rs.yaml

# 5. Initialize mongo replicaset
kubectl exec -it mongod-0 -c mongod-container -- mongo

rs.initiate({_id: "MainRepSet", version: 1, members: [
  { _id: 0, host : "mongod-0.mongodb-service.default.svc.cluster.local:27017" },
]});
rs.status(); # wait until become PRIMARY

# 6. Create admin user in mongodb
db.getSiblingDB("admin").createUser({
  user : "jrcsuser",
  pwd  : "password",
  roles: [ { role: "root", db: "admin" } ]
});
```
