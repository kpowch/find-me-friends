
import PropTypes from 'prop-types';
import React from 'react';
import Sidebar from './Sidebar.jsx'
import SuggestionList from './SuggestionList.jsx'

console.log('do even exist over here in Profile.jsx?')

export default class Profile extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props);
    console.log('this.props is: ', this.props.current_user)
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = {
      user: {
        first_name: this.props.current_user.first_name,
        last_name: this.props.current_user.last_name,
        email: this.props.current_user.email
      },
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
          <Sidebar user={this.state.user}/>
        </div>
        <div className="list-container">
          <SuggestionList friends={this.state.friends}/>
        </div>
      </div>
    );
  }
}
