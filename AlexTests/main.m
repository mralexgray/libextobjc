//
//  main.m
//  AlexTests
//
//  Created by Alex Gray on 5/27/13.
//
//

#import <Foundation/Foundation.h>
#import <extobjc_OSX/EXTVarargs.h>


static NSString *varargs_test_func_no_constants (const char *types, ...) {
    NSArray *args = unpack_args(types);
	return [args componentsJoinedByString:@","];
}

#define varargs_test_func_no_constants(...) \
        varargs_test_func_no_constants(pack_args(0, __VA_ARGS__))


int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	 NSLog(@"%@",  varargs_test_func_no_constants(@"whatever", @2, "i hate you!", @[@"vageen"], 3));
		
	}
    return 0;
}

