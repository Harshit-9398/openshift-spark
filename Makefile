REPO=mattf

.PHONY: build
build: build-base build-master build-worker
clean: clean-base clean-master clean-worker
push: push-master push-worker

build-base:
	docker build -t openshift-spark-base base

build-master:
	docker build -t openshift-spark-master master

build-worker:
	docker build -t openshift-spark-worker worker

clean-base:
	docker rmi openshift-spark-base

clean-master:
	docker rmi openshift-spark-master

clean-worker:
	docker rmi openshift-spark-worker

push-master:
	docker tag -f openshift-spark-master $(REPO)/openshift-spark-master
	docker push $(REPO)/openshift-spark-master

push-worker:
	docker tag -f openshift-spark-worker $(REPO)/openshift-spark-worker
	docker push $(REPO)/openshift-spark-worker
