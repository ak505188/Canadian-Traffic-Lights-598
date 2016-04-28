#include <stdio.h>
#include <string.h>

// Used for sleep might change with Rabbit
#include <unistd.h>

// green    = 0;
// yellow   = 1;
// flashing = 2;
// red      = 3;

// Set of traffic lights such as N/S or E/W
struct traffic_light {
	short current_light;
	short delays[4];
	char* light_name;
};

// function declarations
void init_traffic_light(struct traffic_light *cur, char* name);
void print_light_status(struct traffic_light light);
void run_canadian_traffic_lights (struct traffic_light *light1, struct traffic_light *light2);
void change_light(struct traffic_light *light, short color);
char* cur_light_color(short light);

int main () {
	struct traffic_light ns_light, ew_light;
	init_traffic_light(&ns_light, "N/S Light");
	init_traffic_light(&ew_light, "E/W Light");
	run_canadian_traffic_lights (&ns_light, &ew_light);
}

// Under linux duration is used for seconds
// This might change with the Rabbit
void init_traffic_light(struct traffic_light *cur, char* name) {
	cur->current_light = 3;
	cur->delays[0] = 60;
	cur->delays[1] = 5;
	cur->delays[2] = 15;
	cur->delays[3] = 2;
	cur->light_name = name;
}

void print_light_status(struct traffic_light light) {
	printf("%s: %s\n", light.light_name, cur_light_color(light.current_light));
}

void run_canadian_traffic_lights (struct traffic_light *light1, struct traffic_light *light2) {
	struct traffic_light cur = *light1;
	short cur_light = 0;
	while (1) {
		change_light(&cur, 2);
		change_light(&cur, 0);
		change_light(&cur, 1);
		change_light(&cur, 3);

		// Switch Lights
		if (cur_light == 0) {
			cur = *light2;
			cur_light = 1;
		} else if (cur_light == 1) {
			cur = *light1;
			cur_light = 0;
		}
	}
}

// This will change the light, print the new light status, and sleep for duration
void change_light(struct traffic_light *light, short color) {
	light->current_light = color;
	print_light_status(*light);
	sleep(light->delays[color]);
}

char* cur_light_color(short light) {
	switch (light) {
	case(0):
		return "Green";
	case(1):
		return "Yellow";
	case(2):
		return "Flashing";
	case(3):
		return "Red";
	default:
		return "Unknown";
	}
}
