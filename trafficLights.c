// #use <stdio.h>
// #use <string.h>

// Used for sleep might change with Rabbit
// #use <unistd.h>

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
void change_light(struct traffic_light *light, short color);
char* cur_light_color(short light);
short cur_light;

int main () {
	struct traffic_light ns_light, ew_light, cur;
	init_traffic_light(&ns_light, "N/S Light");
	init_traffic_light(&ew_light, "E/W Light");

	cur = ns_light;
   cur_light = 0;
	while (1) {
   	costate {
			change_light(&cur, 2);
         waitfor(DelayMs(1000 * cur.delays[2]));
			change_light(&cur, 0);
         waitfor(DelayMs(1000 * cur.delays[0]));
			change_light(&cur, 1);
         waitfor(DelayMs(1000 * cur.delays[1]));
			change_light(&cur, 3);
         waitfor(DelayMs(1000 * cur.delays[3]));
    		// Switch Lights
  			if (cur_light == 0) {
				cur = ew_light;
				cur_light = 1;
			} else if (cur_light == 1) {
		  		cur = ns_light;
		  		cur_light = 0;
			}
      }
	}
}

// Under linux duration is used for seconds
// This might change with the Rabbit
void init_traffic_light(struct traffic_light *cur, char* name) {
	cur->current_light = 3;
	cur->delays[0] = 5;
	cur->delays[1] = 1;
	cur->delays[2] = 3;
	cur->delays[3] = 1;
	cur->light_name = name;
}

void print_light_status(struct traffic_light light) {
	printf("%s: %s\n", light.light_name, cur_light_color(light.current_light));
}

// This will change the light, print the new light status, and sleep for duration
void change_light(struct traffic_light *light, short color) {
//	costate {
   	light->current_light = color;
		print_light_status(*light);
//	}
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