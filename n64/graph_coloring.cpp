#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/graph_traits.hpp>
#include <boost/graph/dijkstra_shortest_paths.hpp>
#include <boost/property_map/property_map.hpp>
#include "boost/graph/smallest_last_ordering.hpp"
#include "boost/graph/graphviz.hpp"
#include <iostream>
#include <vector>

namespace boost {
    template <class VertexListGraph, class Order, class Color>
    typename graph_traits<VertexListGraph>::vertices_size_type
    sequential_vertex_color_ting(const VertexListGraph& G,
                                 Order order, Color color)
    {
        typedef graph_traits<VertexListGraph> GraphTraits;
        typedef typename GraphTraits::vertex_descriptor vertex_descriptor;
        typedef typename GraphTraits::vertices_size_type size_type;
        typedef typename property_traits<Color>::value_type ColorType;
        typedef typename property_traits<Order>::value_type OrderType;

        BOOST_CONCEPT_ASSERT(( VertexListGraphConcept<VertexListGraph> ));
        BOOST_CONCEPT_ASSERT(( ReadWritePropertyMapConcept<Color, vertex_descriptor> ));
        BOOST_CONCEPT_ASSERT(( IntegerConcept<ColorType> ));
        BOOST_CONCEPT_ASSERT(( ReadablePropertyMapConcept<Order, size_type> ));
        BOOST_STATIC_ASSERT((is_same<OrderType, vertex_descriptor>::value));

        size_type max_color = 0;
        const size_type V = num_vertices(G);
        std::vector<size_type>
                mark(V, numeric_limits_max(max_color));

        typename GraphTraits::vertex_iterator v, vend;
        for (boost::tie(v, vend) = vertices(G); v != vend; ++v)
            color[*v] = V - 1; // which means "not colored"

        for (size_type i = 0; i < V; i++) {
            vertex_descriptor current = order[i];

            // mark all the colors of the adjacent vertices
            typename GraphTraits::adjacency_iterator ai, aend;
            for (boost::tie(ai, aend) = adjacent_vertices(current, G); ai != aend; ++ai)
                mark[color[*ai]] = i;

            // find the smallest color unused by the adjacent vertices
            size_type smallest_color = 0;
            while (smallest_color < max_color && mark[smallest_color] == i)
                ++smallest_color;

            // if all the colors are used up, increase the number of colors
            if (smallest_color == max_color)
                ++max_color;

            color[current] = smallest_color;
        }
        return max_color;
    }
} // namespace boost




namespace boost {
    template <class VertexListGraph, class Order, class Degree,
            class Marker, class BucketSorter>
    void
    smallest_last_ordering(const VertexListGraph& G, Order order,
                           Degree degree, Marker marker,
                           BucketSorter& degree_buckets) {
        typedef typename boost::graph_traits<VertexListGraph> GraphTraits;

        typedef typename GraphTraits::vertex_descriptor Vertex;
        //typedef typename GraphTraits::size_type size_type;
        typedef size_t size_type;

        const size_type num = num_vertices(G);

        typename GraphTraits::vertex_iterator v, vend;
        for (boost::tie(v, vend) = vertices(G); v != vend; ++v) {
            put(marker, *v, num);
            put(degree, *v, out_degree(*v, G));
            degree_buckets.push(*v);
        }

        size_type minimum_degree = 1;
        size_type current_order = num - 1;

        while ( true ) {
            typedef typename BucketSorter::stack MDStack;
            MDStack minimum_degree_stack = degree_buckets[minimum_degree];
            while (minimum_degree_stack.empty())
                minimum_degree_stack = degree_buckets[++minimum_degree];

            Vertex node = minimum_degree_stack.top();
            put(order, current_order, node);

            if ( current_order == 0 ) //find all vertices
                break;

            minimum_degree_stack.pop();
            put(marker, node, 0); //node has been ordered.

            typename GraphTraits::adjacency_iterator v, vend;
            for (boost::tie(v,vend) = adjacent_vertices(node, G); v != vend; ++v)

                if ( get(marker, *v) > current_order ) { //*v is unordered vertex
                    put(marker, *v, current_order);   //mark the columns adjacent to node

                    //It is possible minimum degree goes down
                    //Here we keep tracking it.
                    put(degree, *v, get(degree, *v) - 1);
                    minimum_degree = std::min(minimum_degree, get(degree, *v));

                    //update the position of *v in the bucket sorter
                    degree_buckets.update(*v);
                }

            current_order--;
        }
        //at this point, get(order, i) == vertex(i, g);
    }
} // namespace boost

//namespace boost {
//  template <class VertexListGraph, class Order, class Color>
//  typename graph_traits<VertexListGraph>::vertices_size_type
//  sequential_vertex_color_ting(const VertexListGraph& G,
//    Order order, Color color)
//  {
//    using GraphTraits = graph_traits<VertexListGraph>;
//    using vertex_descriptor = typename GraphTraits::vertex_descriptor;
//    using size_type = typename GraphTraits::vertices_size_type;
//    using ColorType = typename property_traits<Color>::value_type;
//    using OrderType = typename property_traits<Order>::value_type;
//
//    BOOST_CONCEPT_ASSERT(( VertexListGraphConcept<VertexListGraph> ));
//    BOOST_CONCEPT_ASSERT(( ReadWritePropertyMapConcept<Color, vertex_descriptor> ));
//    BOOST_CONCEPT_ASSERT(( IntegerConcept<ColorType> ));
//    BOOST_CONCEPT_ASSERT(( ReadablePropertyMapConcept<Order, size_type> ));
//    BOOST_STATIC_ASSERT((is_same<OrderType, vertex_descriptor>::value));
//
//    size_type max_color = 0;
//    const size_type V = num_vertices(G);
//    std::vector<size_type>
//      mark(V, numeric_limits_max(max_color));
//
//
//    for (auto [v, vend] = vertices(G); v != vend; ++v)
//      color[*v] = V - 1; // which means "not colored"
//
//    for (size_type i = 0; i < V; i++) {
//      vertex_descriptor current = order[i];
//
//      // mark all the colors of the adjacent vertices
//      for (auto [ai, a_end] = adjacent_vertices(current, G); ai != a_end; ++ai)
//        mark[color[*ai]] = i;
//
//      // find the smallest color unused by the adjacent vertices
//      size_type smallest_color = 0;
//      while (smallest_color < max_color && mark[smallest_color] == i)
//        ++smallest_color;
//
//      // if all the colors are used up, increase the number of colors
//      if (smallest_color == max_color)
//        ++max_color;
//
//      color[current] = smallest_color;
//    }
//    for (size_type i = 0; i < V; i++) {
//      vertex_descriptor current = order[i];
//      std::cout << color[i] << std::endl;
//    }
//    std::cout << "max_color: " << max_color << std::endl;
//    return max_color;
//  }
//} // namespace boost
  //
using namespace boost;
int main() {
    // create a typedef for the Graph type
    typedef adjacency_list<vecS, vecS, bidirectionalS> Graph;

    // Make convenient labels for the vertices
    enum { A, B, C, D, E, F, N };
    const int my_num_vertices = N;
    const char* name = "ABCDEF";

    // writing out the edges in the graph
    typedef std::pair<int, int> Edge;

    Edge edge_array[] =
{
        Edge(A, D),
        Edge(A, E),
        Edge(A, F),
        Edge(B, C),
        Edge(B, E),
        Edge(B, F),
        Edge(C, E),
        Edge(C, F),
        Edge(D, E),
        Edge(E, F),
        // reverse edges
        Edge(D, A),
        Edge(E, A),
        Edge(F, A),
        Edge(C, B),
        Edge(E, B),
        Edge(F, B),
        Edge(E, C),
        Edge(F, C),
        Edge(E, D),
        Edge(F, E),

};
    /* { Edge(A,B), Edge(A,D), Edge(C,A), Edge(D,C), */
    /*   Edge(C,E), Edge(B,D), Edge(D,E) }; */
	using vertices_size_type = typename boost::graph_traits<Graph>::vertices_size_type;
	typedef typename boost::property_map<Graph, boost::vertex_index_t>::const_type vertex_index_map;
    // declare a graph object
    Graph g(my_num_vertices);
/*     // add the edges to the graph object */
    for (auto & i : edge_array)
      add_edge(i.first, i.second, g);
    std::cout << "graph:" << std::endl;
    for (auto [v, vend] = edges(g); v != vend; ++v)
      std::cout << *v << std::endl;
    std::cout << "end graph" << std::endl;
    // print the out degrees of all vertexes
    for (auto [v, vend] = vertices(g); v != vend; ++v)
        std::cout << "out-degree(" << name[*v] << ") = " << out_degree(*v, g) << std::endl;
    for (auto [v, vend] = vertices(g); v != vend; ++v)
        std::cout << "in-degree(" << name[*v] << ") = " << in_degree(*v, g) << std::endl;
//    int num = 5;
//    using BucketSorter = bucket_sorter< size_t, int, std::vector<int>, property_map<Graph, int>>;
//    std::vector<int> order(my_num_vertices);
//    iterator_property_map<int*, vertex_index_map> order_map(order.data(), get(vertex_index, g));
//    auto foo = get(vertex_index, g);
//    auto deg = make_shared_array_property_map(
//            num_vertices(g), 0, get(vertex_index, g));
//    BucketSorter degree_buckets(num, num, deg, get(vertex_index, g));
//    BucketSorter degree_buckets(0, 0);
//    BucketSorter degree_buckets(num, num, deg, deg);

//
//    iterator_property_map<int*, vertex_index_map> degree{degree_buckets.get_map(), get(vertex_index, g)};
//    iterator_property_map<int*, vertex_index_map> marker{degree_buckets.get_map(), get(vertex_index, g)};
//    for (auto [v, vend] = vertices(g); v != vend; ++v)
//    {
//        put(marker, *v, num);
//        put(degree, *v, out_degree(*v, g));
//        std::cout << *v << std::endl;
////        degree_buckets.push(*v);
//    }


    std::vector< typename boost::graph_traits< Graph >::vertex_descriptor >
    o = boost::smallest_last_vertex_ordering(g);
    std::cout << "Ordering:" << std::endl;
    for (unsigned long & it : o) {
      std::cout << it << ": " << name[it] << std::endl;
    }
    std::cout << "End ordering" << std::endl;
    std::vector<vertices_size_type> color_vec(my_num_vertices);
    boost::iterator_property_map<vertices_size_type*, vertex_index_map>
              color(&color_vec.front(), get(boost::vertex_index, g));
//    boost::smallest_last_ordering(g,
//                                 boost::make_iterator_property_map(
//                                         o.begin(),
//                                         boost::identity_property_map(),
//                                         boost::graph_traits< Graph >::null_vertex()
//                                 ),
//                                 color
//    );
    boost::sequential_vertex_color_ting(g,
                                 boost::make_iterator_property_map(
                                         o.begin(),
                                         boost::identity_property_map(),
                                         boost::graph_traits< Graph >::null_vertex()
                                 ),
                                 color
    );
    write_graphviz(std::cout, g);
    return 0;
}
