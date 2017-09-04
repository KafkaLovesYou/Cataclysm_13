#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "lavaland"

        #include "map_files\NewEngland\newengland_wasteland.dmm"
        #include "map_files\NewEngland\newengland_underground.dmm"
        #include "map_files\NewEngland\newengland_level2.dmm"
        #include "map_files\NewEngland\buildings.dmm"

		#define MAP_PATH "map_files/NewEngland"
        #define MAP_FILE "newengland_wasteland.dmm"
        #define MAP_NAME "Wasteland of New England"
        #define MAP_FACTIONS_LIST list( "none", "city", "raiders")

		#define MAP_TRANSITION_CONFIG list()

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring wasteland debug.

#endif
