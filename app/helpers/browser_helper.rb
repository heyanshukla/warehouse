module BrowserHelper
  def link_to_node(text, node, *args)
    options = args.last.is_a?(Hash) ? args.pop : {}
    link_to text, url_for_node(node, args.first), options
  end

  def url_for_node(node, rev = nil)
    paths = node.respond_to?(:paths) ? node.paths : node.to_s.split('/')
    rev = rev ? rev.to_s : params[:rev]
    rev = "r#{rev}" unless rev =~ /^r/
    rev ? rev_browser_path(:paths => paths, :rev => rev) : browser_path(:paths => paths)
  end
end
