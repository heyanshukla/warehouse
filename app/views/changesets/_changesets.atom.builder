changesets.each do |changeset|
  feed.entry(changeset, :url => hosted_url(changeset.repository, :changeset, changeset)) do |entry|
    entry.title("[#{changeset.revision}] #{truncate(h(changeset.message), 50)} by #{changeset.author}")
    entry.summary(simple_format(h(changeset.message)), :type => :html)
    entry.content("<ul>#{render :partial => "changesets/changes", :locals => { :changeset => changeset, :changes => changeset.changes.paginate }}</ul>", :type => 'html')
    entry.updated(changeset.changed_at.xmlschema)
    entry.author do |author|
      author.name(changeset.author)
    end
  end
end