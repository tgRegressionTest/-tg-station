#if !defined(MAP_FILE)

        #include "map_files\autotestmap.dmm"

        #define MAP_FILE "autotestmap.dmm"
        #define MAP_NAME "Automatic Testing Map"

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring Automatic Testing Map.

#endif
