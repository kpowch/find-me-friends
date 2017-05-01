import PropTypes from 'prop-types';
import React from 'react';
import Sidebar from './Sidebar.jsx'
import SuggestionList from './SuggestionList.jsx'
import Pending from './Pending.jsx'

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
    console.log('props', props)
    this.state = {
      suggested: this.props.suggested_friends,
      friendshipId: this.props.current_user.friendship_id,
      firstName: this.props.current_user.first_name,
      lastName: this.props.current_user.last_name,
      email: this.props.current_user.email,
      profilePicture: this.props.current_user.profile_picture.thumb.url,
      bio: this.props.current_user.bio,
      friends: this.props.current_friends,
      pending: this.props.pending_friends
    };
    this.remove = this.remove.bind(this);
  }

  accept(friend){
    console.log('in profile accept function')
    var friends = this.state.friends.filter(function(fnd){
      return friend.id !== fnd.id;
    });
    var pending = this.state.pending.concat(function(fnd){
      return friend.id === fnd.id;
    });
    this.setState({
      friends: friends,
      pending: pending
    });
  }

  remove(friend){
    console.log('in profile remove function')
    var friends = this.state.friends.filter(function(fnd){
      return friend.id !== fnd.id;
    });
    this.setState({
      friends: friends
    });
  }

  render() {
    return (
      <div className="list-container">
          <Sidebar first_name={this.state.first_name} last_name={this.state.last_name} email={this.state.email} bio={this.state.bio} profile_picture={this.state.profilePicture}/>
          <Pending pending={this.state.pending} onRemove={this.remove}/>
          <SuggestionList friends={this.state.friends} onRemove={this.remove} onAccept={this.accept}/>
      </div>
    );
  }
}
