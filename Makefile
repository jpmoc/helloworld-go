DKR_IMAGE_FAMILY_NAME?= emayssatware/helloworld-go
DKR_IMAGE_CNAME?= $(DKR_IMAGE_FAMILY_NAME)

build_image:
	docker build -t $(DKR_IMAGE_CNAME) .

push_image:
	docker push $(DKR_IMAGE_CNAME)

apply_kservice:
	# Make sure you are deploying the image that was just built!
	kubectl apply -f kservice-v1.yaml
	# kubectl apply -f kservice-v2.yaml

curl_kservice:
	curl http://helloworld-go.default.127.0.0.1.xip.io
	# Hello Go Sample v1

unapply_kservice:
	kubectl delete -f kservice-v1.yaml
	# kubectl delete -f kservice-v2.yaml
