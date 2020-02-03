// Fix for darwin-x64
#ifdef SWIGMAC
typedef unsigned long long int uint64_t;
#endif

%apply intptr_t { std::ptrdiff_t };
