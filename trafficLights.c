#include <stdio.h>

short green    = 0;
short yellow   = 1;
short flashing = 2;
short red      = 3;

// Set of traffic lights such as N/S or E/W
struct traffic_light {
	short current_light;
	int green_duration;
	int yellow_duration;
	int flashing_duration;
	int red_duration;
};

// function declarations
void init_traffic_light(struct traffic_light *cur);
void print_light_status(struct traffic_light light);

int main () {
	printf("Hello World!");
	struct traffic_light ns_light, ew_light;
	init_traffic_light(&ns_light);
	init_traffic_light(&ew_light);
	print_light_status(ns_light);
	print_light_status(ew_light);

}

void init_traffic_light(struct traffic_light *cur) {
	cur->current_light     = 0;
	cur->green_duration    = 1000;
	cur->yellow_duration   = 100;
	cur->flashing_duration = 500;
	cur->red_duration      = 1000;
}

void print_light_status(struct traffic_light light) {
	printf("Current  Light duration: %d\n", light.current_light);
	printf("Green    Light duration: %d\n", light.green_duration);
	printf("Yellow   Light duration: %d\n", light.yellow_duration);
	printf("Flashing Light duration: %d\n", light.flashing_duration);
	printf("Red      Light duration: %d\n", light.red_duration);
}
