require_dependency 'polls_hook_listener'

Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings default: {'empty' => true}, partial: 'settings/poll_settings'

  # menu :application_menu, :polls, { controller: 'polls', action: 'index' }, caption: 'Polls'
  project_module :polls do
    permission :view_polls, polls: :index
    permission :vote_polls, polls: :vote
  end
  permission :polls, { polls: [:index, :vote] }, public: true
  menu :project_menu, :polls, { controller: 'polls', action: 'index' }, caption: 'Polls', after: :activity, param: :project_id
end
