import React from 'react';
import ReactDOM from 'react-dom';

class Sidebar extends React.Component {

  render() {
    return (
      <main className="sidebar">
        <div className="sidebar-name">
          {this.props.user.first_name}
          {this.props.user.last_name}
        </div>
        <div className="sidebar-picture">
          {this.props.user.profile_picture}
        </div>
        <div className="sidebar-email">
          {this.props.user.email}
        </div>
        <div className="sidebar-bio">
          {this.props.user.bio}
        </div>
      </main>
    );
  }
}

export default Sidebar;