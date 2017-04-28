
import PropTypes from 'prop-types';
import React from 'react';
import Sidebar from './Sidebar.jsx'
import SuggestionList from './SuggestionList.jsx'

console.log('do even exist over here in Profile.jsx?')

export default class Profile extends React.Component {
  static propTypes = {};

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props);
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = {
      first_name: this.props.current_user.first_name,
      last_name: this.props.current_user.last_name,
      email: this.props.current_user.email,
      profile_picture: this.props.current_user.profile_picture.thumb.url,
      bio: this.props.current_user.bio,
      friends: [
        'Darryl',
        'Steve',
        'Brendan Walker'
      ]
    };
  }

  render() {
    return (
      <div className="profile">
        <div>
          <Sidebar first_name={this.state.first_name} last_name={this.state.last_name} email={this.state.email} bio={this.state.bio} profile_picture={this.state.profile_picture}/>
        </div>
        <div className="list-container">
          <SuggestionList friends={this.state.friends}/>
        </div>
      </div>
    );
  }
}
