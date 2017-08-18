KCTL=kubectl --namespace=kube-system

deploy:
	$(KCTL) apply -f manifests/deployment.yaml
	$(KCTL) apply -f manifests/service.yaml
	$(KCTL) apply -f manifests/ds.yaml

teardown:
	$(KCTL) delete -f manifests/service.yaml
	$(KCTL) delete -f manifests/ds.yaml
	$(KCTL) delete -f manifests/deployment.yaml

test-push:
	docker pull busybox && \
	docker tag busybox localhost:5000/busybox
	docker push localhost:5000/busybox
