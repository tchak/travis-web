`import { test, moduleForComponent } from 'ember-qunit'`

moduleForComponent 'builds-item', {
  needs: ['helper:format-sha', 'helper:format-duration', 'helper:format-time',
          'helper:format-message', 'helper:pretty-date']
}

test 'it renders', (assert) ->

  attributes = {
    id: 10000,
    state: 'passed'
    number: 11,
    branch: 'foobarbranch',
    message: undefined,
    pullRequest: false,
    eventType: 'push',
    commit: {
      sha: "a5e8093098f9c0fb46856b753fb8943c7fbf26f3",
      branch: 'foobarbranch',
      authorName: 'Test Author',
      authorEmail: 'author@example.com'
    }
    repo: {
      slug: 'foo/bar'
    }
  }
  component = @subject(build: attributes)
  @append()

  ok component.$().hasClass('passed'), 'component has right status class'
  equal component.$('.tile-main h2 small').text(), 'foobarbranch', 'component renders branch if event is push'
  equal component.$('.tile-author img').attr('src'), 'https://www.gravatar.com/avatar/5c1e6d6e64e12aca17657581a48005d1?s=40&d=https%3A%2F%2Ftravis-ci.org%2Fimages%2Fui%2Fdefault-avatar.png', 'component renders right gravatar image'
  equal component.$('.build-status + p a').attr('href'), 'https://github.com/foo/bar/commit/a5e8093098f9c0fb46856b753fb8943c7fbf26f3', 'component generates right commit link'
