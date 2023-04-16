#include "map"
#include "string"
#include "iostream"
#include "boost/property_map/property_map.hpp"
#include "boost/property_map/shared_array_property_map.hpp"

int main() {
    std::map<std::string, std::string> things{
            {"ball", "red"},
            {"crayon", "green"},
            {"drums", "blue"},
    };
    boost::associative_property_map<std::map<std::string, std::string>> pm = things;
    auto arr = boost::make_shared_array_property_map(5, 0, pm);
//    std::cout << arr[] << std::endl;

    int ptr[]{1, 2, 3, 4, 5};
    const boost::shared_array<int> arr2(ptr);
    std::cout << arr2[0] << std::endl;
//    boost::shared_array
    std::cout << get(pm, "ball") << std::endl;
    std::cout << pm["ball"] << std::endl;
    for (auto const& [key, value] : things) {
        std::cout << key << " is " << value << std::endl;
    }
    return 0;
}