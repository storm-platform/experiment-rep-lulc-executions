build:
	cd environment && ./build.sh

experiment_01:
	cd experiment/execution_01 && ./run.sh

experiment_02:
	cd experiment/execution_02 && ./run.sh

all_experiments: build experiment_01 experiment_02

# Validation section
validation_build:
	docker build -t "experiment_software_version:temp" -f verification/Dockerfile .

validation_diff_plot: validation_build
	docker run -ti -d --name experiment_software_raster_diff_plot -v ${PWD}:/opt/experiment/ \
		experiment_software_version:temp python verification/difference_plot.py

clean:
	docker rm -f experiment_software_raster_diff_plot
