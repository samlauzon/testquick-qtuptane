
#ifndef __libuptane_h
#define __libuptane_h



// Expose these things to the application layer
extern void uptane_init( void );
extern void uptane_finish( void ); 

// Application layer Callbacks 
extern void send_isotp_file( int target, int data_type, char *filename ); 
extern int check_status( int target ); 

extern void set_callback( void *fn ); 


#define VERSION_MAJOR 0
#define VERSION_MINOR 1
#define VERSION_BUILD 37

#endif //__libuptane_h
