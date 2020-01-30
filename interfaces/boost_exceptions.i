#ifdef BOOST_NO_EXCEPTIONS

%{
namespace boost {
    void throw_exception(std::exception const & e) {
        _swig_gopanic(e.what());
    }
}
%}

#endif
